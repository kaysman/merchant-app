import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {

  greet(): string {
    return "Hi, to get all orders, request to /orders";
  }
}
