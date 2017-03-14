module Gitodo
  class Todo < Slayer::Form
    attribute :display_index,  String
    attribute :internal_index, Integer
    attribute :todo,           String
  end
end
