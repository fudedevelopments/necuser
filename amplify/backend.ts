import { defineBackend } from '@aws-amplify/backend';
import { auth } from './auth/resource';
import { data } from './data/resource';
import { aws_dynamodb } from "aws-cdk-lib";

export const backend = defineBackend({
  auth,
  data,
});

const externalEventTable = backend.createStack("MyEventTable");
const externalTable = aws_dynamodb.Table.fromTableName(
  externalEventTable,
  "EventDetailsTable",
  "EventDetails-fqr4z4ojbzhvlpozte5niclpcq-NONE"
);
backend.data.addDynamoDbDataSource(
  "ExternalEventTableDataSource",
  externalTable
);

backend.addOutput({
  storage: {
    aws_region: "ap-south-1",
    bucket_name: "amplify-necadmin-prave-sa-amplifyteamdrivebucket28-6xxo8vkleuba"
  },
});