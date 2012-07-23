class XmlDocument
  attr_accessor :indents, :indent_level
  
  def initialize(indents=false)
    self.indents = indents
    self.indent_level = 0
  end
  
  def render_tag(tag_name, attrs = {}, &block)
    xml = nil
    
    attrs_string = attrs.map do |key, value|
      "#{key}='#{value}'"
    end.join(" ")
    
    elements = []
    if block
      indent_level.times { elements << "  " } if self.indents
      elements << (attrs.size == 0 ? "<#{tag_name}>" : "<#{tag_name} #{attrs_string}>")
      elements << "\n" if self.indents

      self.indent_level += 1
      elements << yield
      self.indent_level -=1

      indent_level.times { elements << "  " } if self.indents
      elements << "</#{tag_name}>"
      elements << "\n" if self.indents
    else
      indent_level.times { elements << "  " } if self.indents
      elements << (attrs.size == 0 ? "<#{tag_name}/>" : "<#{tag_name} #{attrs_string}/>")
      elements << "\n" if self.indents
    end

    elements.join
  end
  
  def method_missing(method_name, *args, &block)
    render_tag(method_name, *args, &block)
  end
end