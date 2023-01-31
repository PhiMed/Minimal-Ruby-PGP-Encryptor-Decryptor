![oliver-paaske-66BgmIglPhM-unsplash](https://user-images.githubusercontent.com/87627363/196723809-13da56ec-f685-480e-ab50-b92182632944.jpg)

This is an absolute bare-bones pure Ruby application that will perform PGP encryption and decryption of user provided text files via the command line. 

Methods used here are borrowed from the archived [EncryptoSigno Gem](https://github.com/krystal/encrypto-signo)

**Setup:**

* Using your own private/public PGP key pair:
  * Create a file in the `/config` directory of this application called `local_env.yml`
  *  In that file, enter the paths to your keys like this:
    ```
      public_key_path: '/path/to/your/key' 
      private_key_path: '/path/to/your/key' 
    ```

**To use:**

From the command line:

* To encrypt a file:

  `$ruby runner.rb <path_to_file_you_wish_to_encrypt> -encrypt`

  Application will encrypt the contents of the file using the _public_ key and save it in the same directory as the original with the same name, but with a '.pgp' extension replacing the original extention. 

* To decrypt a file:

  `$ruby runner.rb <path_to_file_you_wish_to_encrypt> -decrypt`

  (file extension must be .pgp)

  Application will decrypt it using the _private_ key, and save it as a new .txt file

* Optional flags:

  **-csv**

    * eg. `$ruby runner.rb <path_to_file_you_wish_to_encrypt> -decrypt -csv`

    * For decryption, this will override the default '.txt' and save the decrypted file as a CSV.

Photo by <a href="https://unsplash.com/ja/@photolli?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Oliver Paaske</a> on <a href="https://unsplash.com/s/photos/rocks?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  
