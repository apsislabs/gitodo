module Gitodo
  class DoneTodoForm < Slayer::Form
    attribute :todo_indexes, Array[String]
  end
end
