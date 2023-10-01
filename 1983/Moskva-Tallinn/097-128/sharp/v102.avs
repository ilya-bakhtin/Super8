import("..\1983-Moskva-Tallinn.avs")

v102 = LSMASHVideoSource(dst_dir + "v102rc.mp4")

v102 = v102.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v102 = v102.convertToYV12(interlaced=false)

v102 = v102.deScratch
v102 = v102.removeDirt

v102 = v102.UnsharpMask(strength=500, radius=5, threshold=1)
v102 = v102.adjustBorders

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102.audioDub(va)

return v102.Prefetch

