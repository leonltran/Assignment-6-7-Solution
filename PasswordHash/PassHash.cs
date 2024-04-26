using System;
using System.Text;
using System.Security.Cryptography;

namespace PasswordHash
{
    public class PassHash
    {
        //Hash a value with a salt from the program
        public static string Hash(string value, string salt)
        {
            using (var sha = new SHA512CryptoServiceProvider())
            {
                var hashedString = sha.ComputeHash(Encoding.Default.GetBytes(value + salt));

                return Convert.ToBase64String(hashedString);
            }
        }
    }
}
