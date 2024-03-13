CREATE TABLE "Customers" (
    "Id" UUID NOT NULL,
    "CPF" TEXT NOT NULL,
    "FirstName" CHARACTER VARYING(30) NOT NULL,
    "LastName" CHARACTER VARYING(80) NOT NULL,
    "Email" CHARACTER VARYING(60) NOT NULL,
    "RegistrationDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "LastUpdated" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    CONSTRAINT "PK_Customers" PRIMARY KEY("Id")
);

CREATE TABLE "Products" (
    "Id" UUID NOT NULL,
    "Name" CHARACTER VARYING(40) NOT NULL, 
    "Description" CHARACTER VARYING(300) NOT NULL,
    "Price" MONEY NOT NULL,
    "Category" TEXT NOT NULL,
    "PreparationTime" INTEGER NOT NULL, 
    "Enabled" BOOLEAN NOT NULL,
    CONSTRAINT "PK_Products" PRIMARY KEY("Id")
);

CREATE TABLE "Images" (
    "Id" UUID NOT NULL,
    "ProductId" UUID NOT NULL,
    "Url" TEXT NOT NULL,
    CONSTRAINT "PK_Images" PRIMARY KEY("Id"),
    CONSTRAINT "FK_Images_Products_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products" ("Id") ON DELETE CASCADE 
);

CREATE TABLE "Orders" (
    "Id" UUID NOT NULL,
    "ShoppingCartId" UUID NOT NULL,
    "WithdrawalCode" TEXT NOT NULL,
    "OrderNumber" INTEGER NOT NULL,
    CONSTRAINT "PK_Orders" PRIMARY KEY("Id")
);

CREATE TABLE "Payments" (
    "Id" UUID NOT NULL,
    "ShoppingCartId" UUID NOT NULL,
    "Amount" MONEY NOT NULL,
    "PayedAt" TIMESTAMP WITHOUT TIME ZONE,
    "RefusedAt" TIMESTAMP WITHOUT TIME ZONE,
    "Status" TEXT NOT NULL,
    "Method" TEXT NOT NULL,
    CONSTRAINT "PK_Payments" PRIMARY KEY("Id")
);

CREATE TABLE "ShoppingCarts" (
    "Id" UUID NOT NULL,
    "CustomerId" UUID,
    "Closed" BOOLEAN NOT NULL,
    CONSTRAINT "PK_ShoppingCarts" PRIMARY KEY("Id")
);

CREATE TABLE "OrderTrackings" (
    "Id" UUID NOT NULL,
    "Status" TEXT NOT NULL,
    "When" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "Order" UUID NOT NULL,
    CONSTRAINT "PK_OrderTrackings" PRIMARY KEY("Id"),
    CONSTRAINT "FK_OrderTrackings_Orders_Order" FOREIGN KEY("Order") REFERENCES "Orders" ("Id") ON DELETE CASCADE
);

CREATE TABLE "CartItems" (
    "Id" UUID NOT NULL,
    "ShoppingCart" UUID NOT NULL,
    "ProductId" UUID NOT NULL,
    "Price" MONEY NOT NULL,
    "Quantity" INTEGER NOT NULL,
    CONSTRAINT "PK_CartItems" PRIMARY KEY("Id"),
    CONSTRAINT "FK_CartItems_ShoppingCarts_ShoppingCart" FOREIGN KEY("ShoppingCart") REFERENCES "ShoppingCarts" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_CartItems_ShoppingCart" 
ON "CartItems" ("ShoppingCart");

CREATE INDEX "IX_OrderTrackings_Order"
ON "OrderTrackings" ("Order");

CREATE SEQUENCE sq_order_number START 1 MAXVALUE 10000000 INCREMENT 1;

INSERT INTO public."Customers" ("Id", "CPF", "FirstName", "LastName", "Email", "RegistrationDate", "LastUpdated") VALUES ('041b23ad-3b11-441e-bab8-bb9270a09ae1', '10441144799', 'Cinthia', 'Pessanha', 'cinthia@bol.com', '2023-10-29 09:04:30.983869', '2023-10-29 09:04:30.983869');
INSERT INTO public."Customers" ("Id", "CPF", "FirstName", "LastName", "Email", "RegistrationDate", "LastUpdated") VALUES ('ad59ba24-e381-47b7-b50b-c23b599ff72d', '11066001774', 'Viniciuss', 'SSaeta', 'saeta@gmail.com', '2023-10-28 17:52:39.778379', '2023-10-29 10:14:03.538778');
INSERT INTO public."Customers" ("Id", "CPF", "FirstName", "LastName", "Email", "RegistrationDate", "LastUpdated") VALUES ('502459a3-bb2e-49ea-b4ce-c77fa125f5a7', '12345678909', 'Joaquim', 'Teixeira', 'jota.teixeira@uff.br', '2023-10-29 13:08:37.175405', '2023-10-29 13:08:37.175405');

INSERT INTO public."Products" ("Id", "Name", "Description", "Price", "Category", "PreparationTime", "Enabled") VALUES ('4fb2f7fd-37ac-4b62-ae92-959e56114c56', 'Batata Frita', 'Batata Frita crocante em porção pra uma pessoa', '$6.50', 'SideDish', 15, true);
INSERT INTO public."Products" ("Id", "Name", "Description", "Price", "Category", "PreparationTime", "Enabled") VALUES ('489c146c-4dbb-4764-a551-83cd54c1f3a8', 'Sorvete', 'Sorvete', '$45.00', 'Drink', 30, true);

INSERT INTO public."Images" ("Id", "ProductId", "Url") VALUES ('826be918-7fce-4804-8361-73e2de465c38', '4fb2f7fd-37ac-4b62-ae92-959e56114c56', 'https://images.iburguer.com.br/1234');
INSERT INTO public."Images" ("Id", "ProductId", "Url") VALUES ('972fd042-5021-4196-bda3-0bea467efdfb', '489c146c-4dbb-4764-a551-83cd54c1f3a8', 'http://images.meusite.com.br/345');

INSERT INTO public."ShoppingCarts" ("Id", "CustomerId", "Closed") VALUES ('264a1230-cff1-44b7-8052-ddf2797bfab9', null, false);
INSERT INTO public."ShoppingCarts" ("Id", "CustomerId", "Closed") VALUES ('73d77d13-57fe-458d-8dcd-334def66a71d', 'ad59ba24-e381-47b7-b50b-c23b599ff72d', false);

INSERT INTO public."CartItems" ("Id", "ShoppingCart", "ProductId", "Price", "Quantity") VALUES ('7287ff8e-b287-4c13-8a59-e483264202f4', '264a1230-cff1-44b7-8052-ddf2797bfab9', '4fb2f7fd-37ac-4b62-ae92-959e56114c56', '$6.50', 3);
INSERT INTO public."CartItems" ("Id", "ShoppingCart", "ProductId", "Price", "Quantity") VALUES ('13a029d0-2633-4637-8278-062770a06b26', '73d77d13-57fe-458d-8dcd-334def66a71d', '489c146c-4dbb-4764-a551-83cd54c1f3a8', '$45.00', 2);

INSERT INTO public."Payments" ("Id", "ShoppingCartId", "Amount", "PayedAt", "RefusedAt", "Status", "Method") VALUES ('ea5a942b-04f3-40fc-96f0-a910de509ee3', '264a1230-cff1-44b7-8052-ddf2797bfab9', '$19.50', '2023-10-30 19:29:45.749572', null, 'Received', 'QRCode');
INSERT INTO public."Payments" ("Id", "ShoppingCartId", "Amount", "PayedAt", "RefusedAt", "Status", "Method") VALUES ('55e9644f-67d4-401c-9bbf-e1822be96b51', '73d77d13-57fe-458d-8dcd-334def66a71d', '$90.00', '2023-10-30 20:50:53.442538', null, 'Received', 'QRCode');

INSERT INTO public."Orders" ("Id", "ShoppingCartId", "WithdrawalCode", "OrderNumber") VALUES ('64a04865-e7ce-4cbc-996e-021bf90ffb8c', '264a1230-cff1-44b7-8052-ddf2797bfab9', '1QT5J4', NEXTVAL('sq_order_number'));
INSERT INTO public."Orders" ("Id", "ShoppingCartId", "WithdrawalCode", "OrderNumber") VALUES ('e4d7a543-7804-44e9-a490-6dda557fd2ab', '73d77d13-57fe-458d-8dcd-334def66a71d', 'WOL7I1', NEXTVAL('sq_order_number'));

INSERT INTO public."OrderTrackings" ("Id", "Status", "When", "Order") VALUES ('731d7fa8-599e-4d1b-92fa-172397a722f3', 'WaitingForPayment', '2023-10-30 19:29:50.497089', '64a04865-e7ce-4cbc-996e-021bf90ffb8c');
INSERT INTO public."OrderTrackings" ("Id", "Status", "When", "Order") VALUES ('606cadd3-ba93-4ba7-9b2f-90fb76cf57a4', 'Confirmed', '2023-10-30 19:30:04.654222', '64a04865-e7ce-4cbc-996e-021bf90ffb8c');
INSERT INTO public."OrderTrackings" ("Id", "Status", "When", "Order") VALUES ('ef868ef3-a085-4381-b5af-e3a72673bdc1', 'WaitingForPayment', '2023-10-30 20:51:12.179146', 'e4d7a543-7804-44e9-a490-6dda557fd2ab');
INSERT INTO public."OrderTrackings" ("Id", "Status", "When", "Order") VALUES ('ddd22acd-077e-4141-8c69-5df440920053', 'Confirmed', '2023-10-30 20:51:19.421740', 'e4d7a543-7804-44e9-a490-6dda557fd2ab');