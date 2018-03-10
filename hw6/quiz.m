 
 truePositive = 85;
 falsePositive = 890;
 falseNegative = 15;
 trueNegative = 10;
 totalExamples = truePositive + falsePositive + falseNegative + trueNegative;
 Accuracy = (truePositive + trueNegative) / totalExamples;
 Precision = (truePositive)/(truePositive + falsePositive);
 Recall = (truePositive) / (truePositive + falseNegative);
 F1 = (2*Precision*Recall)/(Precision + Recall);
 
 % -------------------------------------------------------
 spam = 10;
 nospam = 990;
 y=0;
 trueNegSpam= 990;
 falseNegSpam = 10;
 totalExamSpam = trueNegSpam + falseNegSpam;
 truePosSpam = 0;
  falsePosSpam = 0;
 RecallSpam =  truePosSpam / (truePosSpam + falseNegSpam);
 AccurSpam = (truePosSpam + trueNegSpam) / totalExamSpam;
 %PrecSpam = (truePosSpam) / (truePosSpam + falsePosSpam);
 y=1;
 truePosSpam1 = 10;
 falsePosSpam1 = 990;
 
 