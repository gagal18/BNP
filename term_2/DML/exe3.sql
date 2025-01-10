SELECT ime,
    prezime
FROM Korisnik
    LEFT JOIN Poseta p ON Korisnik.kor_ime = p.kor_ime
    LEFT JOIN Objekt o ON p.id_mesto = o.id_mesto
    LEFT JOIN Grad g ON g.id_mesto = o.id_grad
    LEFT JOIN Sosedi s ON s.grad1 = g.id_mesto
    LEFT JOIN Grad g1 ON s.grad2 = g1.id_mesto
    LEFT JOIN Objekt o1 ON o1.id_grad = g1.id_mesto
    LEFT JOIN Poseta p1 ON p1.kor_ime = Korisnik.kor_ime
    AND p1.id_mesto = o1.id_mesto
    AND p.datum = p1.datum
WHERE p1.id_mesto = o1.id_mesto;