class StandardFormBuilder < ActionView::Helpers::FormBuilder
	def submit(label, *args)
    options = args.extract_options!
    new_class = options[:class] || "button"
    super(label, *(args << options.merge(:class => new_class)))
  end

  def self.create_tagged_field(method_name)
    define_method(method_name) do |label, *args|
      options = args.extract_options!

      custom_label = options[:label] || label.to_s.humanize
      label_class = options[:label_class]

      if @object.class.validators_on(label).collect(&:class).include? ActiveModel::Validations::PresenceValidator
        if label_class.nil?
          label_class = "required"
        else
          label_class = label_class + " required"
        end
      end

      @template.content_tag("dt",
        @template.content_tag("label",
                              custom_label,
                              :for => "#{@object_name}_#{label}", :class => label_class) )+
      @template.content_tag("dd", super(label, *(args << options)))
    end
  end

  field_helpers.each do |name|
    create_tagged_field(name)
  end
end