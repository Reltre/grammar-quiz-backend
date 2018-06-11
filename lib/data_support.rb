require "objspace"

module DataSupport
  def find(id)
    objs = ObjectSpace.each_object(self).to_a
    objs.find { |obj| obj.id == id }
  end
end