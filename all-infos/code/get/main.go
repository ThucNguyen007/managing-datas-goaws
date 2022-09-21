package main

import (
	"context"
	"encoding/json"
	"net/http"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb/types"
)

type Data struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Author string `json:"author"`
}

func get(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err != nil {
		return events.APIGatewayProxyResponse {
			StatusCode: http.StatusInternalServerError,
			Body:       "Error while retrieving AWS credentials",
		}, nil
	}

	svc := dynamodb.NewFromConfig(cfg)
	out, err := svc.GetItem(context.TODO(), &dynamodb.GetItemInput{
		TableName: aws.String("informations1"),
		Key: map[string]types.AttributeValue{
			"id": &types.AttributeValueMemberS{Value: req.PathParameters["id"]},
		},
	})

	if err != nil {
		return events.APIGatewayProxyResponse {
			StatusCode: http.StatusInternalServerError,
			Body:       err.Error(),
		}, nil
	}

	b := Data{}
	err = attributevalue.UnmarshalMap(out.Item, &b)
	if err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: http.StatusInternalServerError,
			Body:       "Error while marshal b's",
		}, nil
	}

	res, _ := json.Marshal(b)
	return events.APIGatewayProxyResponse {
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type": "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body: string(res),
	}, nil
}

func main() {
	lambda.Start(get)
}