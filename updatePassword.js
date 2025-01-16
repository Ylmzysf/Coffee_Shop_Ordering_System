const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');

async function updatePassword() {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'sisler_cafe'
    });

    try {
        const saltRounds = 10;
        const plainPassword = '12345'; // Mevcut şifre
        const hashedPassword = await bcrypt.hash(plainPassword, saltRounds);

        // Debug log
        console.log('Generated hash:', hashedPassword);

        const query = 'UPDATE kullaniciler SET sifre = ? WHERE kullanici_adi = ?';
        const [result] = await connection.execute(query, [hashedPassword, 'admin']);
        
        // Debug log
        console.log('Update result:', result);

        // Verify the update
        const [verification] = await connection.execute('SELECT * FROM kullaniciler WHERE kullanici_adi = ?', ['admin']);
        console.log('Verification - stored hash:', verification[0].sifre);

        // Test the password verification
        const testMatch = await bcrypt.compare(plainPassword, verification[0].sifre);
        console.log('Test verification result:', testMatch);

        console.log('Şifre başarıyla güncellendi!');
    } catch (error) {
        console.error('Hata:', error);
    } finally {
        await connection.end();
    }
}

updatePassword(); 