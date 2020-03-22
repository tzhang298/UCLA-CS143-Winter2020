
<!DOCTYPE html>
<html>
<head><!-- Title and style-formatting -->
  <title>CS143: Project 1</title>
  <style>
    h1 { padding: 60px;
  text-align: center;
  background: #1abc9c;
  color: white;
  font-size: 30px; }
    body { padding: 60px;
  text-align: center;
  background: #1abc9c;
  color: white;
  font-size: 30px; }
    form { text-align: center; }
    legend { font-weight: bold;  }
    fieldset { display: inline-block; }
    textarea { background-color: #ffffff; }
    table { margin-left: auto; margin-right: auto; }
    td { background-color: #888888	; text-align:center; }
  </style>
</head>
<body><!-- Form and input-handling using PHP -->
  <h1> Movie Database Query Form </h1>
  Please enter SQL query in the box below:
  <p><!-- Form to enter SQL Query -->
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="GET">
      <fieldset>
        <legend> Enter Query Here: </legend>
        <textarea name="query" placeholder="Example: SELECT * FROM Actor WHERE id = 10;" ROWS=5 COLS=75></textarea>
        <br/>
        <input type="submit" value="Submit"/>
      </fieldset>
    </form>
  </p>
  <p> <!-- Warning on format -->
    <small>Note: Tables and fields are case-sensitive</small>
  </p>
  <p>
    <?php // PHP-handling of user input using HTTP GET Method
      if ($_SERVER['REQUEST_METHOD'] == "GET")
      {
        $query = $_GET['query'];
      }

      if (!$db_connection = mysql_connect("localhost", "cs143", "")) // Establishing PHP-MySQL Connection
      {
        die("Error: Can't connect to database");
      }

      if (!mysql_select_db("CS143", $db_connection)) // Selecting a database
      {
        die("Error: Can't select database");
      }

      $result = mysql_query($query, $db_connection); // Issuing the query and storing the result
      if ($result) // Only outputting this header if valid input is provided
      {
        echo "<h2> Results From Latest Query: </h2>";
      }
      else if($result == FALSE) // If not a valid query, then it is handled per the demo provided by the instructor
      {
        if ($query == "") { echo ""; }
        else { echo "Please enter valid query.";}
      }
      $table_array = array();

      echo "<table border=1 style='border-collapse: collapse'><tr>";
      while ($row = mysql_fetch_field($result)) // Printing out the table headers depending on user input
      {
        echo "<td>" . $row->name . "</td>";
        array_push($table_array, $row->name);
      }
      echo "</tr>";

      while ($row = mysql_fetch_array($result)) // Printing out the actual DB data
      {
        echo "<tr>";
        foreach ($table_array as $value)
        {
          if ($row[$value] == NULL)
          {
            echo "<td>N/A</td>";
          }
          else
          {
            echo "<td>" . $row[$value] . "</td>";
          }
        }
        echo "</tr>";
      }
      echo "</table>";

      mysql_free_result($result); // Free result memory

      mysql_close($db_connection); // Closing PHP-MySQL Connection
    ?>
  </p>
</body>
</html>
