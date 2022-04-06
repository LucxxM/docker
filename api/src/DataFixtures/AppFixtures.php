<?php

namespace App\DataFixtures;

use App\Entity\Post;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i=0; $i < 100; $i++) { 
            $post = new Post();
            $post->setTitle('Post '.$i);
            $manager->persist($post);
        }

        $manager->flush();
    }
}