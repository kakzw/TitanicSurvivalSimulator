# Titanic Survival Simulation App

This project is a SwiftUI-based simulation app that predicts the survival chance of passengers and crew members aboard the Titanic. 
The app uses machine learning models to simulate survival probabilities based on various input attributes. 
It includes a maze mini-game to visualize the simulation results interactively.

## Features
- **Input Details**
  - Select passenger class, sex, age, number of siblings/spouses, number of parents/children, fare, embarked port, etc.
  - The app predicts survival chances based on these inputs using a pre-trained machine learning model (`ann_model.tflite` file).
  - Changes to attributes automatically trigger a prediction update.
- **Simulation**
  - Predicts survival chance based on the input details using a pre-trained model.
  - Displays the predicted survival percentage.
- **Maze Game**
  - Upon initiating a simulation, users are presented with a maze challenge.
  - The complexity of the maze varies based on predicted survival chance:
      - Survival chance ≥50% leads to an easy maze.
      - Survival chance <50% leads to a medium maze.
      - Users must navigate the maze within a specified time to determine their fate.
- **Result Display**
  - After completing the maze or time running out, users receive a result.
  - The result includes survival status and image of full maze.
 
## Files
- `titanic.csv`: The dataset used to train the model. The original dataset can be found <a href="https://datasetsearch.research.google.com/search?source=post_page-----bb6d0dc3378b--------------------------------&src=2&query=Titanic%20Disaster%20Dataset&docid=L2cvMTFqbnp3dF9mXw%3D%3D">here</a>.
- `neural_network.ipynb`: Python script to make ANN model.
- `ann_model.tflite`: TensorFlow Lite model converted from ANN model created in `neural_network.ipynb`.
- `TitanicSurvivalSimulator.xcworkspace`: Workspace that include `TensorFlowLiteSwift` library.

## Screenshots
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/4dff51a1-a1fc-4936-8099-a81a61259d1e" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/26474b06-6280-4c02-bfbf-04aa9fc4f4d0" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/24f7a53b-c983-49c6-9ccc-49582ad4cda5" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/8eb70641-a5dd-42a4-9a7e-36b46d553d9c" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/644841d8-ad6e-4ee7-95d8-0ca48d68e3c7" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/c4817f51-ea6a-4088-810b-0da6248f68a7" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/0de67a26-025e-4b29-a203-2a33a0a31fc0" width="300">
<img src="https://github.com/kakzw/PasswordManager/assets/167830553/b5f25624-6c6c-4933-8263-e78912b16f44" width="300">

## Installation
1. To run this app, make sure you have `XCode` installed.
2. Clone this repository.
3. Open `TitanicSurvivalSimulator.xcworkspace` in `XCode`.
4. Build and run the app on your iOS device or simulator.

## App Usage
1. **Create Persona**
   - Provide necessary passenger details such as passenger class, name, age, sex, fare, embarked port etc.
2. **Prediction**
   - When any changes are made to the persona, it updates the survival chance automatically.
3. **Maze Game**
   - After the prediction, tap "Simulate" button to enter the maze game.
   - Navigate the maze using the provided controls (arrows) to reach the destination.
4. **Result**
   - Upon completion of the maze, view the result screen to see if the passenger survived.
  
## ANN Model
### Model Overview
The model architecture consists of:
- Input layer
  ```Python
  ann.add(tf.keras.layers.Dense(units=6,activation='relu'))
  ```
- Multiple hidden layers with ReLU activation
  ```Python
  for _ in range(3):
    ann.add(tf.keras.layers.Dense(units=6, activation='relu'))
  ```
- Output layer with Sigmoid activation (for binary classification)
  ```Python
  ann.add(tf.keras.layers.Dense(units=1,activation='sigmoid'))
  ```

### Features
- `pclass`: Passenger class (1st, 2nd, 3rd)
- `sex`: Gender of the passenger (0 for male, 1 for female)
- `age`: Age of the passenger
- `sibsp`: Number of siblings/spouses aboard
- `parch`: Number of parents/children aboard
- `fare`: Passenger fare
- `embarked`: Port of embarkation (C = Cherbourg, Q = Queenstown, S = Southampton)

### Preprocessing Steps
1. **Encoding Categorical Variables**
   - `sex` is transformed into binary (0 for male, 1 for female).
   - `embarked` is one-hot encoded using `sklearn.preprocessing.OneHotEncoder`.
2. **Feature Scaling**
   - Standard scaling (`sklearn.preprocessing.StandardScaler`) is applied to normalize the input features.

### Model Training
The ANN is trained using the following configuration:
- Optimizer: Adam
- Loss Function: Binary Crossentropy
- Metrics: Accuracy
```Python
ann.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
```

### Training and Evaluation
The model is trained and evaluated using a train-test split (80-20)
```Python
# Training the ANN
ann.fit(X_train, y_train, batch_size=2, epochs=100)

# Evaluating the model on test data
loss, accuracy = ann.evaluate(X_test, y_test)
print(f'Test Accuracy: {accuracy}')
```
The accuracy was 80.86%.

### Exporting to TensorFlow Lite
The trained ANN model is converted to TensorFlow Lite (.tflite) format for mobile deployment:
```Python
# convert ANN model to TensorFlow Lite
converter = tf.lite.TFLiteConverter.from_keras_model(ann)
tflite_model = converter.convert()

# save the TensorFlow Lite model
with open('ann_model.tflite', 'wb') as f:
    f.write(tflite_model)
```

### Usage
To use the model in your app:
1. Run all cells in `neural_network.ipynb` to get TensorFlow Lite model, `ann_model.tflite`.
2. Install `CocoaPods` if you haven't. The instruction on how to install `CocoaPods` is described in the next section.
3. Drag and drop your `ann_model.tflite` file into your Xcode project. Make sure to add it to your app's target.
4. Import the TensorFlowLite module in your Swift file where you want to use the TensorFlow Lite model.
   ```swift
   import TensorFlowLite
   ```

### CocoaPods Installation
1. Open terminal and type:
   ```bash
   sudo gem install cocoapods
   ```
2. Go to your project directory.
   ```bash
   cd /your_project_path
   ```
3. Create a `PodFile`.
   ```bash
   touch podfile
   ```
4. Open the `PodFile`.
   ```bash
   open -e podfile
   ```
   This will open a podfile like TextEdit.
5. Add the TensorFlow Lite pod.
   ```bash
   # Uncomment the next line to define a global platform for your project
   # platform :ios, '14.0'

   target 'your_project_name' do

     # Comment the next line if you don't want to use dynamic frameworks
     use_frameworks!

     # Pods for your_project_name
     pod 'TensorFlowLiteSwift'
   end

   # Add this line to specify the platform for the abstract target 'Pods'
   platform :ios, '14.0'
   ```
6. Install the pod
   ```bash
   pod install
   ```

## Requirements
- iOS 14.0+
- XCode 17.0+
