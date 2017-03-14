module Gitodo
  class ListTodoForm < Slayer::Form
    attribute :todo_indexes, Array[String]
  end
end
