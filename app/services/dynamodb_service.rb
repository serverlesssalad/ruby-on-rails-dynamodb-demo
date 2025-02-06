class DynamoDBService
    TABLE_NAME = "words"
  
    def self.get_all_words
      DYNAMODB_CLIENT.scan(table_name: TABLE_NAME).items
    end
  
    def self.get_word(word_id)
      DYNAMODB_CLIENT.get_item(
        table_name: TABLE_NAME,
        key: { id: word_id }
      ).item
    end
  
    def self.create_word(word)
      word_id = SecureRandom.uuid  # Generate a unique ID
      DYNAMODB_CLIENT.put_item(
        table_name: TABLE_NAME,
        item: { id: word_id, word: word }
      )
      { id: word_id, word: word }
    end
  
    def self.update_word(word_id, word)
      DYNAMODB_CLIENT.update_item(
        table_name: TABLE_NAME,
        key: { id: word_id },
        update_expression: "SET word = :w",
        expression_attribute_values: { ":w" => word },
        return_values: "ALL_NEW"
      ).attributes
    end
  
    def self.delete_word(word_id)
      DYNAMODB_CLIENT.delete_item(
        table_name: TABLE_NAME,
        key: { id: word_id }
      )
      { message: "Word deleted successfully" }
    end
  end
  