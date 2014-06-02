module ProductInherit
  def self.included(base)
    base.has_one :product, :as => :as_product, :autosave => true
    base.validate :product_properties_must_be_valid
    base.alias_method_chain :product, :autobuild
    base.extend ClassMethods
    base.define_product_properties_accessors
  end

  def product_with_autobuild
    product_without_autobuild || build_product
  end

  def method_missing(meth, *args, &blk)
    product.send(meth, *args, &blk)
  rescue NoMethodError
    super
  end

  module ClassMethods
    def define_product_properties_accessors
      all_attributes = Product.content_columns.map(&:name)
      ignored_attributes = ["created_at", "updated_at", "as_product_type"]
      attributes_to_delegate = all_attributes - ignored_attributes
      attributes_to_delegate.each do |attrib|
        class_eval <<-RUBY
          def #{attrib}
            product.#{attrib}
          end

          def #{attrib}=(value)
            self.product.#{attrib} = value
          end

          def #{attrib}?
            self.product.#{attrib}?
          end
        RUBY
      end
    end
  end

protected
  def product_properties_must_be_valid
    unless product.valid?
      product.errors.each do |attr, message|
        errors.add(attr, message)
      end
    end
  end
end
