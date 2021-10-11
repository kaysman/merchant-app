import { Controller, Get, Param, Post, Body } from '@nestjs/common';
import { OrderObjectType } from './order.interface';
import { OrderService } from './order.service';


@Controller('orders')
export class OrderController {
    constructor (private readonly orderService: OrderService){}

    @Get()
    getAllOrders() {
        return this.orderService.getAllOrdersFromFirebase();
    }

    @Get(':id')
    getOrder(@Param('id') orderId: string) {
        return this.orderService.getOrder(orderId);
    }

    @Post('add')
    postOrder(@Body() orderDto: OrderObjectType[]){
        return this.orderService.postOrder(orderDto);
    }

}