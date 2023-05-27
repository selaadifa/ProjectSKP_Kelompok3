<x-filament::page>
    <form wire:submit.prevent="submit" class="space-y-6">
        {{ $this->form }}
        <!-- {{ $this->nama }} -->

        <div class="flex flex-wrap items-center gap-4 justify-start">
            <x-filament::button type="submit">
                Pilih
            </x-filament::button>
        </div>
        @if($this->skp)
        @livewire('penilaian-table', ['skp' => $this->skp])
        @endif
    </form>
</x-filament::page>
