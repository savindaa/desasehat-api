class Message
  def self.not_found(record = "record")
    "Maaf, #{record} tidak ditemukan."
  end

  def self.invalid_credentials
    "Informasi user salah."
  end

  def self.invalid_token
    "Invalid token"
  end

  def self.missing_token
    "Missing token"
  end

  def self.unauthorized
    "Unauthorized request"
  end

  def self.expired_token
    "Sorry, your token has expired. Please login to continue."
  end

  def self.user_not_found
    "User tidak terdaftar."
  end

  def self.otp_not_match
    "OTP tidak cocok."
  end

  def self.patient_accepted
    "Tidak bisa menghapus Campaign yang telah divalidasi."
  end

  def self.max_upload(count)
    "Maksimal upload gambar adalah #{count.to_s}."
  end

  def self.beyond_privilege
    "Perubahan User diluar wewenang Anda."
  end

  def self.su_only
    "Hanya Super Admin yang bisa melakukan tindakan ini."
  end
end
