using System;
using System.Text;
using System.Security.Cryptography;

namespace DLLClassLib
{
    public class PasswordHash
    {
        //Hash a value with a salt
        public string Hash(string value, string salt)
        {
            using (var sha = new SHA512CryptoServiceProvider())
            {
                var hashedString = sha.ComputeHash(Encoding.Default.GetBytes(value + salt));
                return Convert.ToBase64String(hashedString);
            }
        }
        }
}
    