//all solution of equation

 #include<iostream>

using namespace std;

void bruteForce(int*, int, int*, int, int, int, int&);

int main()
{
	int number, C, counter= 0, size = 11;
	int arr[size], data[100] = {0};

	cout << "\nFinding solutions to x1 + x2 + ... + xn = C"<<endl;
	cout << "Enter the value of nunmber: ";
	cin >> number;
	for (int i=0; i <= 10; i++)
		arr[i] = i;
	cout << "Enter the sum constant (C <= 10): ";
	cin >> C;
	cout << "Possible Non-negative Integral solutions [ ";
	for(int i=0; i<number; i++)
		cout << "x" << i+1 << " ";
	cout << " ] :" << endl;

	bruteForce(arr, size, data, number-1, 0, C, counter);
	cout << "\nFound " << counter << " Solutions"<<endl;
	return 0;
}

void bruteForce(int* arr, int size, int* data, int last, int index, int C, int &counter)
{
	for(int i=0; i<size; i++)
	{
		data[index] = arr[i];
		if(index == last)
		{
			int sum = 0;
			for(int j=0; j<index+1; j++)
				sum += data[j];

			if(sum == C)
			{
				cout << "[ ";
				for(int j=0; j<index+1; j++)
					cout << data[j] << " ";
				cout << "] ";
				counter++;
			}
		}

		else
			bruteForce(arr, size, data, last, index+1, C, counter);
	}
}
