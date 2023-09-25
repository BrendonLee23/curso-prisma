    datasource db {
    provider = "postgresql"
    url      = env("DATABASE_URL")
    }

    generator client {
    provider = "prisma-client-js"
    }

    model User {
    id       Int      @id @default(autoincrement())
    email    String   @unique
    password String
    profile  Profile?
    role     Role     @default(USER)
    }

    model Profile {
    id             Int             @id @default(autoincrement())
    firstName      String
    lastName       String
    userId         Int             @unique
    user           User            @relation(fields: [userId], references: [id])
    address        Address?
    ProfileService ProfileService?
    }

    model Address {
    id        Int      @id @default(autoincrement())
    street    String
    number    Int
    zipcode   String   @unique
    profileId Int?     @unique
    profile   Profile? @relation(fields: [profileId], references: [id])
    }

    model ProfileService {
    id          Int     @id @default(autoincrement())
    serviceCode String  @unique
    profileId   Int     @unique
    profile     Profile @relation(fields: [profileId], references: [id])
    serviceId   Int     @unique
    service     Service @relation(fields: [serviceId], references: [id])
    }

    model Service {
    id             Int             @id @default(autoincrement())
    description    String
    ProfileService ProfileService?
    }

    enum Role {
    USER
    ADMIN
    }
