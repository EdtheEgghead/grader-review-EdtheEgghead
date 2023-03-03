CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then
    echo "ListExamples found"
else 
    echo "File not found, try again"
    exit 1
fi

cd ..
cp TestListExamples.java student-submission
cp -r lib student-submission

cd student-submission
TEMP=`javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2>error.txt`

COUNT=`wc -l error.txt`
SUB=0
if [[ "$COUNT" == *"$SUB"* ]]; then
  echo "Pass no lines"
else
    echo "Fail"
fi

TEMP=`java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples 2>junit-results.txt`

# # STR=$(tail -n 3 junit-results.txt)



