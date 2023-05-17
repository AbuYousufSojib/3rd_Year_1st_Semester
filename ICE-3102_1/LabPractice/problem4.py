def TowerOfHanoi(n, from_rod, to_rod, aux_rod):
    if n == 1:
        print("Move disk 1 from Source rod",from_rod, "Destination rod",to_rod)
        return
    TowerOfHanoi(n - 1,from_rod,aux_rod,to_rod)
    print("Move disk",n, "from Source rod",from_rod, "To Destination rod ",to_rod)
    TowerOfHanoi(n-1, aux_rod, to_rod, from_rod)
n= int(input("Enter the number of disk: "))
TowerOfHanoi(n, 'A', 'C', 'B')