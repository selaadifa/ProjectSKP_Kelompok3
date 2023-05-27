<?php

namespace App\Filament\Resources\SKPResource\Pages;

use App\Filament\Resources\SKPResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSKP extends EditRecord
{
    protected static string $resource = SKPResource::class;

    protected function getActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
