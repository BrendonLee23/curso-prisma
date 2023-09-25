import { Post } from '@prisma/client';

import db from "../database/database";
import prisma from "../database/database";

const TABLE_NAME = "posts";

export type CreatePost = Omit<Post, "id">

async function getPosts(){

  const posts = await prisma.Posts.findMany()
  return posts
}

async function getPost(id: number) {
  const post = await prisma.Posts.findFirst({
    where: { id: id },
  })
  return post
}

async function createPost(post: CreatePost) {

    await prisma.Posts.create({
    data: post,
  })
}

async function deletePost(id: number) {

  await prisma.Posts.delete({
    where: {id: id},
  });
}

const postRepository = {
  getPost,
  getPosts,
  createPost,
  deletePost
}

export default postRepository;