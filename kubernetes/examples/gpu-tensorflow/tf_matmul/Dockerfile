FROM tensorflow/tensorflow:latest-gpu

WORKDIR /app

COPY matmul.py .

# run test app 
CMD echo "run info: $MATMUL_DEVICE, $MATMUL_SHAPE" && python matmul.py $MATMUL_DEVICE $MATMUL_SHAPE
