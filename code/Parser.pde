class Parser{
  ArrayList<Circle> circles = new ArrayList<Circle>();
  HashMap<Integer, Circle> circlesMap = new HashMap<Integer, Circle>();
  
  void parse(String filename) {
    String[] lines = loadStrings(filename);
    int numberOfLeaves = int(lines[0]);
      
    int start = 1;
    int end = start + numberOfLeaves;
    for(int i = start; i < end; i++){
      String[] data = split(lines[i], ",");
      int id = int(data[0]);
      float mass = float(data[1]);
      circlesMap.put(id, new Circle(id, mass));
    }
    
    int numberOfRelationShips = int(lines[end]);
    
    start = end + 1;
    end = start + numberOfRelationShips;
    for (int j = start; j < end; j++) {
      String[] data = split(lines[j], ",");
      int cid1 = int(data[0]);
      int cid2 = int(data[1]);
      float edgeWeight = float(data[2]);
      Circle c1 = circlesMap.get(cid1);
      Circle c2 = circlesMap.get(cid2);
      c1.neighbors.put(c2, edgeWeight);
      c2.neighbors.put(c1, edgeWeight);
      circlesMap.put(cid1, c1);
      circlesMap.put(cid2, c2);
    }
    for (Circle circle : circlesMap.values()) {
      circles.add(circle);
    }
  }
}