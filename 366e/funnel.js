function getInput(){
  // grab the two strings from the form
  let inputString1 = document.getElementById('input1').value;
  let inputString2 = document.getElementById('input2').value;

  var result;
  for (i=0; i < inputString1.length; i++){
    var testString = remove_character(inputString1, i);
    if (testString === inputString2){
      result = true;
    }
  }
  if (result != true){
    result = false;
  }

  document.getElementById("result").innerHTML = result;
}

function remove_character(str, char_pos)
 {
  part1 = str.substring(0, char_pos);
  part2 = str.substring(char_pos + 1, str.length);
  return (part1 + part2);
 }
