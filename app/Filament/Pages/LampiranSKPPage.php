<?php

namespace App\Filament\Pages;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\FileUpload;
use Filament\Pages\Page;
use Livewire\TemporaryUploadedFile;

use App\Models\LampiranSKP;

class LampiranSKPPage extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Main Menu';
    protected static ?int $navigationSort = 3;
    protected static ?string $title = 'Lampiran SKP';
    protected static ?string $slug = 'lampiran-skp';
    protected static string $view = 'filament.pages.lampiran-s-k-p';

    public $lampiran;

    protected function getFormSchema(): array
    {
        return [
            Grid::make()
                ->columns(1)
                ->schema([
                    FileUpload::make('lampiran')
                        ->label('Upload 1 atau lebih dokumen')
                        ->multiple()
                        ->directory('lampiran')
                        ->getUploadedFileNameForStorageUsing(function (TemporaryUploadedFile $file): string {
                            return (string) str($file->getClientOriginalName())->prepend(auth()->id().'-'.date("Y-m-d").'-');
                        })
                ]),
        ];
    }

    public function submit()
    {
        $files = $this->form->getState()['lampiran'];
        foreach ($files as $file) {
            LampiranSKP::create([
                'file' => $file,
                'periode' => date('Y'),
                'user_id' => auth()->id(),
            ]);
        }
        $this->reset(['lampiran']);
        $this->notify('success', 'Lampiran berhasil ditambahkan.');
    }
}
