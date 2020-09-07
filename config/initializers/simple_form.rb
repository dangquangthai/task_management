SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: ['form-group', 'control-group'], error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input, class: 'form-control', autocomplete: 'off'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input, class: 'form-control', autocomplete: 'off'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :prepend, tag: 'div', class: 'control-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input, autocomplete: 'off'
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: 'control-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input, autocomplete: 'off'
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.default_wrapper = :bootstrap
end

SimpleForm.browser_validations = false
