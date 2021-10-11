import { BadRequestException, Injectable, NotFoundException } from "@nestjs/common";
import { collection, DocumentData, getDocs, addDoc, orderBy } from 'firebase/firestore/lite';
import { db } from "src/app.module";
import { OrderObjectType } from "./order.interface";

@Injectable()
export class OrderService {

    async getAllOrdersFromFirebase() : Promise<DocumentData[]> {
        const orderDocs = await this.getDocuments();
        return orderDocs;
    }

    async getOrder(id: string) {
        const orderDocs = await this.getDocuments();
        const order = orderDocs.find(order => order.order_id === id);
        if (order){
            return order;
        }
        else {
            throw new NotFoundException();
        }
    } 

    async postOrder(arr: OrderObjectType[]) {
        for (let v of arr) {
            await addDoc(collection(db, "/orders"), v);
        }
        return {'status': 200, 'message': 'Successfully Created'};
    }

    private async getDocuments() {
        const myCollection = collection(db, '/orders');
        const orderDocs = await getDocs(myCollection);
        return orderDocs.docs.map(doc => doc.data());
    }

}