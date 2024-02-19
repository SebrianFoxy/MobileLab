package com.company.birthdayprob.logic;

import java.util.Random;
import java.util.HashSet;
import java.util.Set;

import com.company.birthdayprob.ui.OutputInterface;

public class Logic
       implements LogicInterface {

    public static final String TAG =
        Logic.class.getName();

    OutputInterface mOut;

    public Logic(OutputInterface out){
        mOut = out;
    }

    public void process() {
        int groupSize = mOut.getSize();
        int simulationCount = mOut.getCount();

        if (groupSize < 2 || groupSize > 365) {
            mOut.makeAlertToast("Group Size must be in the range 2-365.");
            return;
        }
        if (simulationCount <= 0) {
            mOut.makeAlertToast("Simulation Count must be positive.");
            return;
        }

        double percent = calculate(groupSize, simulationCount);

        // report results
        mOut.println("For a group of " + groupSize + " people, the percentage");
        mOut.println("of times that two people share the same birthday is");
        mOut.println(String.format("%.2f%% of the time.", percent));

    }

    public double calculate(int size, int count) {
        int matchingBirthdaysCount = 0;

        for (int i = 0; i < count; i++) {
            Random random = new Random(i + 1);
            Set<Integer> uniqueBirthdays = new HashSet<>();
            boolean hasMatchingBirthdays = false;

            for (int j = 0; j < size; j++) {
                int birthday = random.nextInt(365);

                if (uniqueBirthdays.contains(birthday)) {
                    hasMatchingBirthdays = true;
                    break;
                }

                uniqueBirthdays.add(birthday);
            }

            if (hasMatchingBirthdays) {
                matchingBirthdaysCount++;
            }
        }

        double percent = (double) matchingBirthdaysCount / count * 100.0;
        return percent;

    }
    // TODO - add your code here
}
