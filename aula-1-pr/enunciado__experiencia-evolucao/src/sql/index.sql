CREATE TABLE "posts" (
	"id" SERIAL PRIMARY KEY,
	"username" TEXT NOT NULL,
	"title" TEXT NOT NULL,
	"body" TEXT NOT NULL
)


# codigo atualizado


CREATE TABLE "posts" (
	"id" SERIAL PRIMARY KEY,
	"username" TEXT NOT NULL,
	"title" TEXT NOT NULL,
	"content" TEXT NOT NULL,
	"createdAt" DATE DEFAULT (CURRENT_DATE)
);
