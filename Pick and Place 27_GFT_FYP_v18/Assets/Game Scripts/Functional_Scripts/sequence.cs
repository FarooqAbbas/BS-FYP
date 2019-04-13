using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;


public class sequence
{
   

    
    /// <summary>
    //2.Class to generate orignal dictionary
    //1.Random numbers Function
    /// </summary>

    public Dictionary<int, sequence> ObjectsDistribution = new Dictionary<int, sequence>();
    private string name;
    private int random;
    private string destination;
    private static List<int> possibleNumbers;
    private static List<int> resultList; 



    public string Name { get { return name; } set { name = value; } }
    public int Random { get { return random; } set { random = value; } }
    public string Destination { get { return destination; } set { destination = value; } }


    public sequence(string C_name, int C_random,string C_destination)
    {

        Name = C_name;
        Random = C_random;
        Destination = C_destination;
    }

    public static List<int> randomForSequence(int small, int big, int totalNumbers)
    {
        int smallestNumber = small;
        int biggestNumber = big;
        int amountOfRandomNumbers = totalNumbers;

        possibleNumbers = new List<int>();
        for (int i = smallestNumber; i <= biggestNumber; i++)
            possibleNumbers.Add(i);
         resultList = new List<int>();
        System.Random rand = new System.Random();

        for (int i = 0; i < amountOfRandomNumbers; i++)
        {
            int randomNumber = rand.Next(1, possibleNumbers.Count) - 1;
            resultList.Add(possibleNumbers[randomNumber]);
            //Remove the chosen result number from possible numbers list
            possibleNumbers.RemoveAt(randomNumber);
        }

        return resultList;
    }






}
