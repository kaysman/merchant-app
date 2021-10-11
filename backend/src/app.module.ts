import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { OrderModule } from './order/order.module';
import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore/lite';


const firebaseConfig = {
  apiKey: "AIzaSyCKq6YqlaKNICYB0t2pS2l96G08QtYj9EA",
  authDomain: "loadandgo-merchant.firebaseapp.com",
  databaseURL: "https://loadandgo-merchant-default-rtdb.firebaseio.com",
  projectId: "loadandgo-merchant",
  storageBucket: "loadandgo-merchant.appspot.com",
  messagingSenderId: "580324457736",
  appId: "1:580324457736:web:4232a2ea4ca28d8af8c0bd"
};

const app = initializeApp(firebaseConfig)
export const db = getFirestore(app);

@Module({
  imports: [
    OrderModule
  ],
  controllers: [AppController],
  providers: [AppService],
})

export class AppModule {}
