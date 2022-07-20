#include <bits/stdc++.h>
using namespace std;
void DFS(list<int> t[], int node, int parent) {
   int flag = 0;
   for (auto ir : t[node]) {
      if (ir != parent) {
         flag = 1;
         DFS(t, ir, node);
      }
   }
   if (flag == 0)
      cout<<node<<"\t";
}
int main() {
   list<int> t[1005];
   pair<int, int> edges[] = {
      { 1, 2 },
      { 1, 3 },
      { 2, 4 },
      { 3, 5 },
      { 3, 6 },
      { 3, 7 },
      { 6, 8 }
   };
   int cnt = sizeof(edges) / sizeof(edges[0]);
   int node = cnt + 1;
   for (int i = 0; i < cnt; i++) {
      t[edges[i].first].push_back(edges[i].second);
      t[edges[i].second].push_back(edges[i].first);
   }
   cout<<"Leaf nodes of the tree are:\n";
   DFS(t, 1, 0);
   return 0;
}
