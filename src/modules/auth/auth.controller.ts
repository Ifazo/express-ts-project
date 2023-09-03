import { Request, Response } from "express";
import catchAsync from "../../shared/catchAsync";
import { authService } from "./auth.service";
import sendResponse from "../../shared/sendResponse";
import { PrismaClient, User } from "@prisma/client";

const createUser = catchAsync(async (req: Request, res: Response) => {
  const result = await authService.createUser(req.body);
  sendResponse<User>(res, {
    success: true,
    statusCode: 200,
    message: "User created successfully",
    data: result,
  });
});

const loginUser = catchAsync(async (req: Request, res: Response) => {
  const result = await authService.loginUser(req.body);
  sendResponse(res, {
    success: true,
    statusCode: 200,
    message: "User log-in successfully",
    data: result,
  });
});

export const authController = {
  createUser,
  loginUser,
};