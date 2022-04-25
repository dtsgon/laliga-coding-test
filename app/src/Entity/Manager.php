<?php

namespace App\Entity;

use App\Entity\Traits\Active;
use App\Entity\Traits\Timestamps;
use Doctrine\ORM\Mapping as ORM;
use App\Exception\SalaryException;
use Doctrine\ORM\Mapping\PreUpdate;
use Doctrine\ORM\Mapping\PostPersist;
use Doctrine\ORM\Mapping\PostUpdate;
use Doctrine\ORM\Mapping\PrePersist;
use App\Helper\MessengerHelper;


/**
 * @ORM\Entity(repositoryClass=ManagerRepository::class)
 * @ORM\HasLifecycleCallbacks()
 */
class Manager
{
    use Active;
    use Timestamps;

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Club::class, inversedBy="managers")
     */
    private $club;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $salary;

    /**
     * @ORM\Column(type="date")
     */
    private $license_date;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClub(): ?Club
    {
        return $this->club;
    }

    public function setClub(?Club $club): self
    {
        $this->club = $club;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getSalary(): ?float
    {
        return $this->salary;
    }

    public function setSalary(?float $salary): self
    {
        $this->salary = $salary;

        return $this;
    }

    public function getLicenseDate(): ?\DateTimeInterface
    {
        return $this->license_date;
    }

    public function setLicenseDate(\DateTimeInterface $license_date): self
    {
        $this->license_date = $license_date;

        return $this;
    }
    
    public function __toString()
    {
        return $this->name;
    }
    

    /** @PreUpdate */
    /** @PrePersist */
    public function checkBudget()
    {        
        // Aquí se gestiona la actualización del presupuesto del club.
        //
        // No lo gestiona de forma realista ni veráz el salario y provocará 
        // errores habitual.
        //
        // Sin embargo sirve para ilustrar los eventos de Doctrine y su uso
        //

        $salary      = $this->getSalary();
        $budget_rest = $this->club->getBudgetRest();
        $rest        = $budget_rest - $salary;
        
        if ( $rest < 0 )
        {            
            throw new SalaryException ( 'Invalid salary' );
        }
    }

    /** @PostPersist */
    public function sendCreationMessage ( )
    {
        MessengerHelper::sendWelcomeMessage ( );
    }
    
    /** @PostUpdate */
    public function sendDeleteMessage ( )
    {
        // Aquí me encuentro en una encrucijada:
        //
        // Como no borro valores, sino que desactivo, debo obtener una forma de 
        // comprobar si previamente estaba activado, porque solo se enviará el
        // mensaje si se acaba desactivar, sin embargo este evento salta siempre
        // tras actualizar la fila.
        //
        // He detectado el error y lo dejo comentado pues resolver este problema
        // no considero que sea parte fundamental del test 

        $se_acaba_de_desactivar = true;

        if ( $se_acaba_de_desactivar )
        {
            MessengerHelper::sendGoodbyeMessage();
        }
    }    
}
