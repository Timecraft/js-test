public class JSTest.FileManager : Object {

    SourceView source_view = SourceView.get_instance ();

    static FileManager? instance;

    FileManager () {
    }



    public void write_to_file () {
        var file = get_code_test_file ();

        try {
            if (file.query_exists () == true) {
            file.delete (null);
            FileOutputStream fos = file.create (FileCreateFlags.REPLACE_DESTINATION, null);
            DataOutputStream dos = new DataOutputStream (fos);
            dos.put_string (source_view.buffer.text, null);
        }
        }
        catch (Error e) {
            new Alert (_("An error occurred"), e.message);
        }
    }

    public File get_code_test_file () {
        var file = File.new_for_path ("jstest.js");

        try {
            if (!file.query_exists ()) {
                file.create (FileCreateFlags.REPLACE_DESTINATION, null);
                get_code_test_file ();
            }
        }
        catch (Error e) {
            error ("%s", e.message);
        }

        return file;
    }

    public string get_code_test_file_as_string () {
        write_to_file ();
        var file = get_code_test_file ();
        return file.get_path ();
    }

    public string read_file () {
        write_to_file ();
        var file = get_code_test_file ();

        try {
            // Open file for reading and wrap returned FileInputStream into a
            // DataInputStream, so we can read line by line
            var lines = new DataInputStream (file.read ());

            string line;
            string file_as_string = "";

            // Read lines until end of file (null) is reached
            while ((line = lines.read_line (null)) != null) {
            file_as_string += line + "\n";
            }

            return file_as_string;

        }
        catch (Error e) {
            error ("%s", e.message);
        }
    }

    public static FileManager get_instance () {
        if (instance == null) {
            instance = new FileManager ();
        }
        return instance;
    }
}






