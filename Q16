#include <iostream>
using namespace std;

int main()
{
    int e, n;
    cout << "Enter number of vertices:";
    cin >> n;
    cout << "Enter total number of edges:";
    cin >> e;
    int arr[n][n];
    for (int i = 0; i < n; i++) // initializing the whole matrix to 0
    {
        for (int j = 0; j < n; j++)
        {
            arr[i][j] = 0;
        }
        cout << endl;
    }
    int v;
    int u;
    for (int i = 0; i < e; i++)
    {
        cout << "Enter the edge:" << endl;
        cin >> u >> v;
        arr[v][u] = 1;
        arr[u][v] = 1;
    }
    cout << "Adjacency matrix for the data provided:" << endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cout << arr[i][j] << "  ";
        }
        cout << endl;
    }

    bool isComplete = true;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (arr[i][i] != 0)
                isComplete = false;
        }
    }
    if (isComplete)
            cout << "The graph is a complete graph." << endl;
    else
            cout << "Graph is an incomplete graph." << endl;
    return 0;
}
