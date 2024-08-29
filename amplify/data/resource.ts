import { a, defineData, type ClientSchema } from '@aws-amplify/backend';

const schema = a.schema({

  User: a.model({
    name: a.string()
  }).authorization(allow => [allow.publicApiKey()]),
  
  EventDetails: a.customType({
   eventimage: a.string().array(),
    eventname: a.string(),
    eventdetails: a.string(),
    registerurl: a.string(),
    date: a.string(),
    eventlocation: a.string(),
  }),

  ListEvents: a.customType({
    items: a.ref("EventDetails").array(),
    nextToken: a.string() || null,
    scannedCount: a.integer(),
  }),
  
  listevents: a
    .query()
    .returns(a.ref("ListEvents"))
    .authorization(allow => [allow.publicApiKey()])
    .handler(
      a.handler.custom({
        dataSource: "ExternalEventTableDataSource",
        entry : "./getevents.js"
      })
    )
  
  

});

export type Schema = ClientSchema<typeof schema>;
export const data = defineData({
  name :"necuser",
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey',
    apiKeyAuthorizationMode: { expiresInDays: 30 }
  }
});