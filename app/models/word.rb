class Word
    TABLE_NAME = 'words'
  
    def self.table
      DYNAMODB_CLIENT
    end
  
    def self.find_all
      table.scan(table_name: TABLE_NAME).items
    end
  
    def self.find_by_id(id)
      table.get_item(table_name: TABLE_NAME, key: { id: id }).item
    end
  
    def self.create(word)
      table.put_item(table_name: TABLE_NAME, item: { id: SecureRandom.uuid, word: word })
    end
  
    def self.update(id, word)
      table.update_item({
        table_name: TABLE_NAME,
        key: { id: id },
        update_expression: "SET word = :word",
        expression_attribute_values: { ":word" => word }
      })
    end
  
    def self.delete(id)
      table.delete_item(table_name: TABLE_NAME, key: { id: id })
    end
  end
  