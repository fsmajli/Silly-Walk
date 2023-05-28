# Monty Matlab 

This project is a part of the Monty MATLAB project in SS20/21. The task of this project is to differentiate, or classify between normal walks and silly walks. A silly walk is a very weird way of walking which was introduced in an aired sketch in the Monty Python television show. The challenge is to train an intelligent algorithm, a machine learning model, to do the classification task for us.

## Data Collection

Data was collected by recording acceleration data during walks, both normal and silly. This data was then used to train the machine learning model.

## Implementation

The implementation consists of preparing the data, feeding the data into the model for training, and using the trained model for inference. We used a long-short term memory (LSTM) model for classification. The model was trained for 25 epochs with a mini batch-size of 32.

## GUI

The GUI allows the user to train the model with their own data and the freedom of changing the mini batch-size and the number of epochs. The training is visualized through plots of the accuracy and the loss over the epochs. The trained model can be exported.

## Performance and Evaluation

The model was trained for 25 epochs using the training data. The training accuracy and training loss converge to 93% and 0.2%, respectively. The evaluation metrics are as follows:

- Accuracy: 93.1417%
- Balanced Accuracy: 93.14%
- Precision: 91.82%
- Recall: 94.76%


