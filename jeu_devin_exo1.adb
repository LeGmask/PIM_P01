with Ada.Text_Io;           use Ada.Text_Io;
with Ada.Integer_Text_Io;   use Ada.Integer_Text_Io;
with Alea;

-- Auteur : Evann DREUMONT
--
-- Faire deviner un nombre à un utilisateur
procedure Jeu_Devin_Exo1 is
  -- Initialisation de la procedure permettant la génération d'un nombre aléatoire.
  Package Devin_Alea is new Alea(1,999);
  use Devin_Alea;

  Reponse     : Integer;  -- Nombre choisi par l'ordinateur 
  Proposition : Integer;  -- Nombre proposé par l'utilisateur
  Compteur    : Integer;  -- Nombre  de tentatives réalisé par l'utilisateur
begin
  -- Faire choisir un nombre à l'ordinateur
  Get_Random_Number(Reponse); -- Génération d'un nombre entier aléatoire Reponse compris entre 1 et 999
  Put_line("J'ai choisi un nombre entre 1 et 999.");

  -- Faire deviner à un utilisateur le nombre Reponse
  Compteur := 0; -- Initialisation du compteur à 0
  loop
    -- Incrémenter le nombre de coups
    Compteur := Compteur + 1;

    -- Demander à l'utilisateur de faire une Proposition
    Put("Proposition " & Integer'Image(Compteur) & " : ");
    Get(Proposition);
    Skip_Line;
    
    -- Donner une indication à l'utilisateur
    if Proposition > Reponse then
      Put_line("Trop grand.");
    elsif Proposition < Reponse then
      Put_line("Trop petit.");
    else
      Put_line("Trouvé.");
    end if;
    exit when Proposition = Reponse;  -- [déterminer] Repone et Proposition identique
  end loop;

  -- Afficher le message de victoire
  Put("Bravo! Vous avez trouvé " & Integer'Image(Reponse) & " en " & Integer'Image(Compteur));
  if Compteur = 1 then
    Put(" essai.");
  else
    Put(" essais.");
  end if;
  New_Line; -- Evite que le prompt de l'utilisateur ne soit pas sur une nouvelle ligne.
end Jeu_Devin_Exo1;
