// defines the data type List<int> to be called through IntList
typedef IntList = List<int>;

// defines the data type Map<X, List<X>> (X is generic) to be called through ListMapper<X>
typedef ListMapper<X> = Map<X, List<X>>;

void main(List<String> args) {
  IntList il = [1, 2, 3];
  print(il);

  ListMapper<String> a = {
    'keyA': ['a', 'b']
  }; 
  // ListMapper<String> is Map<String,List<String>> 

  print(a);
}
