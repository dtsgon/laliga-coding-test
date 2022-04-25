<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211212233101 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Esta migración añade el presupuesto restarte a los Clubs';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs

        $this->addSql('ALTER TABLE club ADD COLUMN budget_rest DOUBLE NULL DEFAULT 0 AFTER budget;');

        $this->addSql('
            CREATE TEMPORARY table Tsalarios_player  select SUM(salary) total, club_id from player  group by club_id; 
            CREATE TEMPORARY table Tsalarios_manager select SUM(salary) total, club_id from manager group by club_id; 
            UPDATE club c SET c.budget_rest = c.budget where c.id > 0;
            UPDATE club c SET c.budget_rest = c.budget_rest - ( select s.total from Tsalarios_player  s where s.club_id = c.id ) WHERE c.id > 0;
            UPDATE club c SET c.budget_rest = c.budget_rest - ( select s.total from Tsalarios_manager s where s.club_id = c.id ) WHERE c.id > 0;
            drop temporary table Tsalarios_player;
            drop temporary table Tsalarios_manager;');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
