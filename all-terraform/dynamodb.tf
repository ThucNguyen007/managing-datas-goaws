/* resource "aws_dynamodb_table" "informations" {
  name           = "informations"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "items" {
  table_name = aws_dynamodb_table.informations.name
  hash_key   = aws_dynamodb_table.informations.hash_key
  item       = file("source/informations.json")
} */

resource "aws_dynamodb_table" "informations1" {
  name           = "informations1"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "items" {
  table_name = aws_dynamodb_table.informations1.name
  hash_key   = aws_dynamodb_table.informations1.hash_key
  item       = file("source/informations.json")
}
