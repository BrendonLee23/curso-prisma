import { joi } from 'joi';

import { CreatePost } from "../repositories/post-repository";

export const postSchema = joi.object<CreatePost>({
  username: joi.string().required(),
  title: joi.string().required(),
  content: joi.string().required(),
  createdAt: joi.date()
})