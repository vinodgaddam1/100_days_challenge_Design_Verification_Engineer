




module IC74869(

input PIN1,
input PIN2,
output PIN3,

input PIN4,
input PIN5,
output PIN6,



input PIN10,
input PIN9,
output PIN8,


input PIN13,
input PIN12,
output PIN11,

input PIN7,
input PIN14
);

xor g1(PIN3,PIN1,PIN2);

xor g2(PIN6,PIN4,PIN5);


xor g3(PIN8,PIN10,PIN9);


xor g4(PIN11,PIN13,PIN12);
endmodule



























